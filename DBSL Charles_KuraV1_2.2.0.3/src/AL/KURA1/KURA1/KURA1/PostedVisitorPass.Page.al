#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56069 "Posted Visitor Pass"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Visitors Pass";
    SourceTableView = where(Status=filter(Released));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date of visit";"Date of visit")
                {
                    ApplicationArea = Basic;
                }
                field("Time of visit";"Time of visit")
                {
                    ApplicationArea = Basic;
                }
                field("Visitor Name";"Visitor Name")
                {
                    ApplicationArea = Basic;
                }
                field("ID No";"ID No")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile No.";"Mobile No.")
                {
                    ApplicationArea = Basic;
                }
                field(From;From)
                {
                    ApplicationArea = Basic;
                }
                field("Officer to see No";"Officer to see No")
                {
                    ApplicationArea = Basic;
                }
                field("Officer to see Name";"Officer to see Name")
                {
                    ApplicationArea = Basic;
                }
                field(Reason;Reason)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    SetRange(No,No);
                    Report.Run(56236,true,true,Rec);
                end;
            }
        }
    }
}

