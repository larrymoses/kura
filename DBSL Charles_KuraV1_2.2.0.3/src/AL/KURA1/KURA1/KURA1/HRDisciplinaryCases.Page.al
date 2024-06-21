#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69200 "HR Disciplinary Cases"
{
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(EmpNames; EmpNames)
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                    Editable = true;
                    Importance = Promoted;
                }
                field("Job Title"; "Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field(Gender; Gender)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                }
                field("Postal Address"; "Postal Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("No of Disciplinary Cases"; "No of Disciplinary Cases")
                {
                    ApplicationArea = Basic;
                }
            }
            part("HOD Case File"; "HOD Disciplinary Cases SF")
            {
                Caption = 'HOD Case File';
                SubPageLink = "Employee No" = field("No.");
            }
            part("Employee Accused Sect"; "Emp Disciplinary Cases SF")
            {
                Caption = 'Employee Case File';
                SubPageLink = "Employee No" = field("No.");
            }
            part("Case Details"; "HR Disciplinary Cases SF")
            {
                Caption = 'Case Details';
                SubPageLink = "Employee No" = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000001; Outlook)
            {
            }
            systempart(Control1000000002; Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("&Mark as Closed/Open")
                {
                    ApplicationArea = Basic;
                    Caption = '&Mark as Closed/Open';

                    trigger OnAction()
                    begin
                        HRDisciplinary.Reset;
                        HRDisciplinary.SetRange(HRDisciplinary.Selected, true);
                        HRDisciplinary.SetRange(HRDisciplinary."Employee No", "No.");
                        if HRDisciplinary.Find('-') then begin

                            //ENSURE SELECTED RECORDS DO NOT EXCEED ONE
                            Number := 0;
                            Number := HRDisciplinary.Count;
                            if Number > 1 then begin
                                Error('You cannot have more than one application selected');
                                // ERROR(FORMAT(Number)+' applications selected');

                            end;
                            if HRDisciplinary.Status = HRDisciplinary.Status::Open then begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Ongoing;
                                HRDisciplinary.Modify;
                                HRDisciplinary."Closed By" := UserId;
                            end else begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Open;
                                HRDisciplinary.Modify;
                                HRDisciplinary."Closed By" := UserId;
                            end;

                        end else begin
                            Error('No disciplinary case selected');
                        end;
                    end;
                }
                action(Attachments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Employee Discplinary Documents";
                    RunPageLink = "Doc No." = field("No.");
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        HREmp.Reset;
        if HREmp.Get("No.") then begin
            EmpNames := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
        end else begin
            EmpNames := '';
        end;
    end;

    var
        HREmp: Record Employee;
        EmpNames: Text[40];
        HRDisciplinary: Record "HR Disciplinary Cases";
        Number: Integer;
}

