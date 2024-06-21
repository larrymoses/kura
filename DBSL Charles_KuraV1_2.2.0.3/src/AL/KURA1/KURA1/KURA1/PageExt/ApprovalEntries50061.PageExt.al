#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50061 "pageextension50061" extends "Approval Entries"
{

    layout
    {
        addafter("Sender ID")
        {

            field("Sender Name"; Rec."Sender Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sender Name field.';
            }
        }
        //Unsupported feature: Property Insertion (Visible) on ""Last Modified By User ID"(Control 27)".

    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on "Record(Action 38)".

    }
}

