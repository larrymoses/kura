#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 80005 "Import Bill Items"
{
    Caption = 'Import Work Plan Lines';
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("New Road Work Program Activity";"New Road Work Program Activity")
            {
                AutoReplace = true;
                XmlName = 'JobPlanningLines';
                fieldelement(RoadWorkProgID;"New Road Work Program Activity"."Road Work Program ID")
                {
                }
                fieldelement(JobTaskNo;"New Road Work Program Activity"."Budget Entry No")
                {
                }
                fieldelement(LineNo;"New Road Work Program Activity"."Bill Item Category Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(LineType;"New Road Work Program Activity"."Activity Code")
                {
                }
                fieldelement(Type;"New Road Work Program Activity".Description)
                {
                    FieldValidate = yes;
                }
                fieldelement("No.";"New Road Work Program Activity"."Unit of Measure Code")
                {
                }
                fieldelement(Description;"New Road Work Program Activity"."Planned Quantity")
                {
                    FieldValidate = yes;
                }
                fieldelement(uom;"New Road Work Program Activity"."Engineer's Rate (Unit Cost)")
                {
                }
                fieldelement(GeneralBusPG;"New Road Work Program Activity"."Gen. Prod. Posting Group")
                {
                }
                fieldelement(uom;"New Road Work Program Activity"."VAT Prod. Posting Group")
                {
                    MinOccurs = Zero;
                }
                fieldelement(EntryNo;"New Road Work Program Activity"."Entry No")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    //"Job Planning Line"."Line Type":="Job Planning Line"."Line Type"::"Both Budget and Billable";
                end;
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

    trigger OnPostXmlPort()
    begin
        Message('Bill Items imported successfully.');
    end;

    var
        I: Integer;
}

