#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75289 "Contract Representative"
{
    PageType = List;
    SourceTable = "Contract Representative";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Name";"Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Designation/Title";"Designation/Title")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Signing Role";"Contract Signing Role")
                {
                    ApplicationArea = Basic;
                }
                field("Executed on behalf of";"Executed on behalf of")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Execution Date";"Execution Date")
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

