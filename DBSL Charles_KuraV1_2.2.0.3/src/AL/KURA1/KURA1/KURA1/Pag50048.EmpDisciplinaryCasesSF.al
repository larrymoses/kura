/// <summary>
/// Page Emp Disciplinary Cases SF (ID 50044).
/// </summary>
page 50048 "Emp Disciplinary Cases SF"
{
    Caption = 'Emp Disciplinary Cases SF';
    PageType = ListPart;
    SourceTable = "HR Disciplinary Cases";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Case No.';
                    Editable = false;
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Reporting';
                    Editable = false;
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Accuser; Rec.Accuser)
                {
                    Caption = 'Reporter';
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Area of Incident"; Rec."Area of Incident")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Other Persons Involved"; Rec."Other Persons Involved")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("HOD Comments"; Rec."HOD Comments")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Date to Respond"; Rec."Date to Respond")
                {
                    Caption = 'Date to Respond';
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Response to Show Cause"; Rec."Response to Show Cause")
                {
                    Caption = 'Response to Show Cause';
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Disciplinary Hearing"; Rec."Disciplinary Hearing")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Disciplinary Hearing Date"; Rec."Disciplinary Hearing Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Hearing Venue"; Rec."Hearing Venue")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Case Management")
            {
                Caption = 'Case Management';
                action("Notify HR")
                {
                    ApplicationArea = Basic;
                    Image = Reminder;
                    Promoted = true;
                    PromotedIsBig = true;
                    Caption = 'Send Response to HR';

                    trigger OnAction()
                    var
                        DocumentCount: integer;
                        Err002: Label 'Attachment is required.';
                        Txt001: Label 'Are you sure you want to submit response to show cause?';
                    begin
                        if confirm(Txt001, true) then begin
                            Rec.TestField("Date to Respond");

                            DocAttach.Reset();
                            DocAttach.SetRange("Table ID", Database::"HR Disciplinary Cases");
                            DocAttach.SetRange("No.", Rec."Case Number");
                            DocAttach.FindSet;
                            DocumentCount := DocAttach.Count;

                            if DocumentCount = 0 then
                                Error(Err002);

                            Rec.NotifyHROnResponseToShowCause(Rec);
                        end;
                    end;
                }

                action("Appeal Case File")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedIsBig = true;
                    Caption = 'Appeal Internally';

                    trigger OnAction()
                    var
                        Err001: Label 'Appeal for Case No. %1 already exists.';
                        LineNo: Integer;
                    begin
                        if Confirm('Are you sure want to reopen this case?', true) then begin
                            Cases.Get(Rec."Employee No", Rec."Case Number");

                            Appeals.Reset();
                            Appeals.SetRange("Case Number", Rec."Case Number");
                            Appeals.SetRange("Employee No", Rec."Employee No");
                            if Appeals.FindFirst then
                                Error(Err001, Appeals."Case Number");

                            LineNo := 1000;

                            Appeals.Init();
                            Appeals."Case Number" := Rec."Case Number";
                            Appeals."Employee No" := Rec."Employee No";
                            Appeals.Validate("Employee No");
                            Appeals."Appeal Date" := Today;
                            Appeals."Appeal Type" := Appeals."Appeal Type"::Internal;
                            Appeals."Line No." := LineNo;
                            Appeals.Insert();

                            Cases.Status := Rec.Status::"Internal Appeal";
                            Cases."Appeal Date" := Today;
                            Cases."Closed By" := UserId;
                            if Cases.Modify() then
                                Message('Case Marked as Appeal');

                            Rec.NotifyHROnCaseAppeal(Rec);
                        end;
                    end;
                }
                action("Appeal Externally")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedIsBig = true;
                    Caption = 'Appeal Externally';

                    trigger OnAction()
                    var
                        Err001: Label 'Appeal for Case No. %1 already exists.';
                        LineNo: Integer;
                    begin
                        if Confirm('Are you sure want to reopen this case?', true) then begin
                            Cases.Get(Rec."Employee No", Rec."Case Number");

                            Appeals.Reset();
                            Appeals.SetRange("Case Number", Rec."Case Number");
                            Appeals.SetRange("Employee No", Rec."Employee No");
                            Appeals.SetRange("Appeal Type", Appeals."Appeal Type"::External);
                            if Appeals.FindFirst then
                                Error(Err001, Appeals."Case Number");

                            Appeals.Reset();
                            Appeals.SetRange("Case Number", Rec."Case Number");
                            Appeals.SetRange("Employee No", Rec."Employee No");
                            if Appeals.FindLast() then
                                LineNo := Appeals."Line No." + 1000;

                            Appeals.Init();
                            Appeals."Case Number" := Rec."Case Number";
                            Appeals."Employee No" := Rec."Employee No";
                            Appeals.Validate("Employee No");
                            Appeals."Appeal Date" := Today;
                            Appeals."Appeal Type" := Appeals."Appeal Type"::External;
                            Appeals."Line No." := LineNo;
                            Appeals.Insert();

                            Cases.Status := Rec.Status::"External Appeal";
                            Cases."Appeal Date" := Today;
                            Cases."Closed By" := UserId;
                            if Cases.Modify() then
                                Message('Case Marked as Appeal');

                            Rec.NotifyHROnCaseAppeal(Rec);
                        end;
                    end;
                }
            }
            group("Related Information")
            {
                Caption = 'Related Information';
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }
            }
        }
    }

    var
        DocAttach: Record "Document Attachment";
        Appeals: Record "HR Appealed Disc. Cases";
        Cases: Record "HR Disciplinary Cases";
}
