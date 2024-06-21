/// <summary>
/// Page Portal Users (ID 99996).
/// </summary>
page 99996 "Portal Users"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Dynasoft Portal User";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User Name"; "User Name")
                {
                    ApplicationArea = All;

                }
                field("Full Name"; "Full Name")
                {
                    ApplicationArea = BasicHR;
                }
                field("Authentication Email"; "Authentication Email")
                {
                    ApplicationArea = BasicHR;
                }
                field("Mobile Phone No."; "Mobile Phone No.")
                {
                    ApplicationArea = BasicHR;
                }
                field(State; State)
                {
                    ApplicationArea = BasicHR;
                }
                field("Change Password"; "Change Password")
                {
                    ApplicationArea = BasicHR;
                }
                field("Record Type"; "Record Type")
                {
                    ApplicationArea = BasicHR;
                }
                field("Record ID"; "Record ID")
                {
                    ApplicationArea = BasicHR;
                }
                field("Password Value"; "Password Value")
                {
                    ApplicationArea = BasicHR;

                }
                field("Login Type"; "Login Type")
                {
                    ApplicationArea = BasicHR;
                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}