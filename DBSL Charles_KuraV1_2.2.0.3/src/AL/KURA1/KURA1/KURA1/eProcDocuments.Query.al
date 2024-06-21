#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Query 55055 "eProcDocuments"
{

    elements
    {
        dataitem(Procurement_Setup;"Procurement Setup")
        {
            column(Default_Procurement_Template;"Default Procurement Template")
            {
            }
            dataitem(Procurement_Doc_Template_Line;"Procurement Doc Template Line")
            {
                DataItemLink = "Template ID"=Procurement_Setup."Default Procurement Template";
                column(Template_ID;"Template ID")
                {
                }
                column(Procurement_Process;"Procurement Process")
                {
                }
                column(Procurement_Document_Type;"Procurement Document Type")
                {
                }
                column(Description;Description)
                {
                }
                column(Requirement_Type;"Requirement Type")
                {
                }
                column(Track_Certificate_Expiry;"Track Certificate Expiry")
                {
                }
                column(Guidelines_Instruction;"Guidelines/Instruction")
                {
                }
            }
        }
    }
}

