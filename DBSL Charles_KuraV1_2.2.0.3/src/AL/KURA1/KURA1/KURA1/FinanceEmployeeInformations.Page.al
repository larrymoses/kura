#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57205 "Finance Employee  Informations"
{
    CardPageID = "Employee Payment Details Card";
    PageType = List;
    SourceTable = "Employee Payment Information";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee Bank Code"; Rec."Employee Bank Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Code';
                }
                field("Employee Bank Name"; Rec."Employee Bank Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Name';
                    Editable = false;
                }
                field("Employee Bank Branch Code"; Rec."Employee Bank Branch Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Code';
                }
                field("Employee Bank Branch Name"; Rec."Employee Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Name';
                    Editable = false;
                }
                field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Account Number';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Mobile No"; Rec."Employee Mobile No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mobile No';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

