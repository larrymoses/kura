#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50018 "Document Approval Delegation"
{
    PageType = ListPart;
    Caption = 'Delegation Entries';
    SourceTable = "Delegation Entries";
    //  Editable = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Workflow User Group"; Rec."Workflow User Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workflow User Group field.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Approver ID"; Rec."Current Approver ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Approver ID"; Rec."New Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
                field("isGroup Member"; Rec."isGroup Member")
                {
                    ApplicationArea = ALL;
                    Editable = false;

                }
            }
        }
    }


    var

}

#pragma implicitwith restore

