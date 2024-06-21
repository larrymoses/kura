#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59055 "Grant Applicants subform"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Internal Grants Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PI No";"PI No")
                {
                    ApplicationArea = Basic;
                }
                field("PI Name";"PI Name")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Applied";"Amount Applied")
                {
                    ApplicationArea = Basic;
                }
                field("Application Send";"Application Send")
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
    }
}

