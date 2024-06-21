#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 69103 "Staff Planning Lines"
{
    Format = VariableText;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Staff Est Plan Lines";"Staff Est Plan Lines")
            {
                XmlName = 'StaffEstablishment';
                fieldelement(EstablishmentNo;"Staff Est Plan Lines"."Staff Establishment No.")
                {
                }
                fieldelement(JobId;"Staff Est Plan Lines"."Job ID")
                {
                }
                fieldelement(DepartmentCode;"Staff Est Plan Lines"."Department Code")
                {
                }
                fieldelement(DirectorateCode;"Staff Est Plan Lines"."Directorate Code")
                {
                }
                fieldelement(ApprovedQty;"Staff Est Plan Lines"."Approved Establishment")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

