query 50031 MaterialsOnSiteSetup
{

    elements
    {
        dataitem(MaterialOnSiteSetup; "Material On Site Setup")
        {
            column(Blocked; Blocked)
            {
            }
            column(MaterialCode; "Material Code")
            {
            }
            column(MaterialDescription; "Material Description")
            {
            }
            column(UnitOfMeasureCode; "Unit Of Measure Code")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
