#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70051 "Contract Management"
{
    ApplicationArea = Basic;
    CardPageID = "Contract Management Header";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Contract Management Header";
    SourceTableView = where(Status = const(Open),
                            "Assigned User" = filter(''));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field("Contract Description"; "Contract Description")
                {
                    ApplicationArea = Basic;
                }
                field("Tender No"; "Tender No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Vol No"; "Contract Vol No")
                {
                    ApplicationArea = Basic;
                }
                field(Supplier; Supplier)
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Name"; "Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status"; "Contract Status")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No"; "Serial No")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Links)
            {
                Visible = true;
            }
            systempart(Control9; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(test)
            {
                ApplicationArea = Basic;
                Caption = '&Assign Users';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PurchRec: Record "Contract Management Header";
                    Text001: label 'Are you sure you want to assign the selected requisition to a procurement officer';
                begin
                    PurchSetup.Get;
                    //PurchSetup.TESTFIELD("DIRECTOR LEGAL");
                    //IF (USERID = PurchSetup."DIRECTOR LEGAL") THEN BEGIN
                    if Confirm(Text005) = true then begin
                        //ProcPage.RUN;
                        //ProcPage.SETSELECTIONFILTER(UserSetup);
                        if Page.RunModal(51511952, UserSetup) = Action::LookupOK then begin
                            UserRecID := UserSetup."User ID";
                        end;
                        if UserRecID <> '' then begin
                            contractrec.Reset;
                            contractrec.Get(Code);
                            contractrec."Assigned User" := UserRecID;
                            contractrec.Modify;
                            Message('%1  Successfully Assigned', UserRecID);
                        end;
                    end;
                    //END;
                    /*IF (USERID <> PurchSetup."DIRECTOR LEGAL") THEN BEGIN
                       ERROR ('You do not have the right to this function');
                    END;*/

                end;
            }
        }
    }

    var
        PurchSetup: Record "Purchases & Payables Setup";
        UserRecID: Code[70];
        UserSetup: Record "User Setup";
        Text005: label 'Are you sure you want to Assign this Contract to a Legal Officer?';
        contractrec: Record "Contract Management Header";
}

