#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69761 "Medical Lines"
{
    PageType = ListPart;
    SourceTable = "Prehire Medical Report Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Medical History Type";"Medical History Type")
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Medical History Response";"Medical History Response")
                {
                    ApplicationArea = Basic;
                }
                field("Medical Examination Results";"Medical Examination Results")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Details";"Additional Details")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Last Vaccination";"Date of Last Vaccination")
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

