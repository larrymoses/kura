#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69289 "Hr Case Witness"
{
    PageType = List;
    SourceTable = "Hr Case Witness";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Case Number";"Case Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Witness is Staff";"Witness is Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Witness Number";"Witness Number")
                {
                    ApplicationArea = Basic;
                }
                field("Witness Name";"Witness Name")
                {
                    ApplicationArea = Basic;
                }
                field("Witness Statement";"Witness Statement")
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

