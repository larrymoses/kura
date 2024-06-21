#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 50006 "Emloyees"
{
    Direction = Both;
    Format = VariableText;

    schema
    {
        textelement(employees)
        {
            tableelement(Customer; Customer)
            {
                AutoUpdate = true;
                XmlName = 'C';
                fieldelement(NO; Customer."No.")
                {
                    Width = 10;
                }
                fieldelement(Name; Customer.Name)
                {
                }
                fieldelement(a; Customer.Address)
                {
                }
                fieldelement(b; Customer."Address 2")
                {
                }
                fieldelement(c; Customer.City)
                {
                }
                fieldelement(d; Customer."Post Code")
                {
                }
                fieldelement(e; Customer."Country/Region Code")
                {
                }
                fieldelement(f; Customer."Phone No.")
                {
                }
                fieldelement(g; Customer."Search Name")
                {
                }
                fieldelement(i; Customer."Home Page")
                {
                }
                fieldelement(j; Customer."Balance (LCY)")
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

