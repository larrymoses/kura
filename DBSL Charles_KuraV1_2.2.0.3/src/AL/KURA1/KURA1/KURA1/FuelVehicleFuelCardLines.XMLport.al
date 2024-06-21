#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 55012 "Fuel Vehicle Fuel Card Lines"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("Vehicle Fuel Card Lines";"Vehicle Fuel Card Lines")
            {
                XmlName = 'FC';
                fieldelement(no;"Vehicle Fuel Card Lines"."No.")
                {
                }
                fieldelement(ReceiptNo;"Vehicle Fuel Card Lines"."Reciept No")
                {
                }
                fieldelement(RegNo;"Vehicle Fuel Card Lines".Amount)
                {
                }
                fieldelement(Make;"Vehicle Fuel Card Lines"."Date of Fueling")
                {
                }
                fieldelement(Model;"Vehicle Fuel Card Lines".Driver)
                {
                }
                fieldelement("FCardNo.";"Vehicle Fuel Card Lines"."Driver Names")
                {
                }
                fieldelement(FCPin;"Vehicle Fuel Card Lines"."Vehicle RegNo")
                {
                }
                fieldelement(Amount;"Vehicle Fuel Card Lines"."vehicle Make")
                {
                }
                fieldelement(Other;"Vehicle Fuel Card Lines"."Other Expenses")
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

