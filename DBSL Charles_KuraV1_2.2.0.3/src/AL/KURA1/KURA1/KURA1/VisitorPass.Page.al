#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56064 "Visitor Pass"
{
    PageType = Card;
    SourceTable = "Visitors Pass";

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
                field("Officers Comment";"Officers Comment")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control18;Notes)
            {
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
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PostedMemo;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                      //Visitor.TESTFIELD(Visitor."Created By",USERID);
                       TestField(Reason);
                       TestField("Visitor Name");
                       TestField("ID No");
                       TestField("Officer to see Name");
                       TestField("Officers Comment");

                       Modify;

                    Message('Posted successfully');
                end;
            }
        }
    }

    var
        text001: label 'Status must be Released to allow posting';
        Visitor: Record "Visitors Pass";
}

