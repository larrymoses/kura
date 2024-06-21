/// <summary>
/// Page App Welfare  Membership (ID 50097).
/// </summary>
page 50097 "App Welfare  Membership"
{
    Caption = 'App Welfare  Membership';
    PageType = Card;
    SourceTable = "Hr Welfare Header";
    DeleteAllowed = false;
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Welfare No.";Rec."Welfare No.")
                {
                }
                field("Welfare Type";Rec."Welfare Type")
                {
                }
                field("Raised By";Rec."Raised By")
                {
                }
                field("Raisee Name";Rec."Raisee Name")
                {
                }
                field(Description;Rec.Description)
                {
                }
                field("Created By";Rec."Created By")
                {
                }
                field("Created On";Rec."Created On")
                {
                }
                field(Status;Rec.Status)
                {
                }
                field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                }
                field("Global Dimension 1";Rec."Global Dimension 1")
                {
                }
                field("Global Dimension 2";Rec."Global Dimension 2")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Add Member")
            {
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Employee.RESET;
                    Employee.SETRANGE("No.",Rec."Raised By");
                    Employee.SETRANGE("Welfare Member",FALSE);
                    IF Employee.FINDSET THEN BEGIN
                      Employee."Welfare Member":=TRUE;
                      Employee.MODIFY;
                      MESSAGE(TXT001,Employee."No.");
                      Rec.Status:= Rec.Status::Closed;
                      Rec.MODIFY;
                    END ELSE
                    BEGIN
                      ERROR('The Employee %1,is already a welfare member,kindly check',Rec."Raised By");
                    END;
                end;
            }
        }
    }

    var
        Employee: Record 5200;
        TXT001: Label 'The Employee %1, has been succesfully added';
}

