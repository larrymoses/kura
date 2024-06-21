#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 55011 "Fuel Card Import"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("Fuel Card";"Fuel Card")
            {
                XmlName = 'FC';
                fieldelement(no;"Fuel Card".No)
                {
                }
                fieldelement(ReceiptNo;"Fuel Card"."Receipt No")
                {
                }
                fieldelement(RegNo;"Fuel Card"."Registration No.")
                {
                }
                fieldelement(Make;"Fuel Card".Make)
                {
                }
                fieldelement(Model;"Fuel Card".Model)
                {
                }
                fieldelement("FCardNo.";"Fuel Card"."Fuel Card No.")
                {
                }
                fieldelement(FCPin;"Fuel Card"."Fuel Card Pin")
                {
                }
                fieldelement(Amount;"Fuel Card"."Total Amount Spend")
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

