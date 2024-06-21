#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 80003 "Import Job Planning Lines"
{
    Caption = 'Import Work Plan Lines';
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Job Planning Line"; "Job Planning Line")
            {
                AutoReplace = true;
                XmlName = 'JobPlanningLines';
                fieldelement(LineNo; "Job Planning Line"."Line No.")
                {
                }
                fieldelement(JobNo; "Job Planning Line"."Job No.")
                {
                }
                fieldelement(JobTaskNo; "Job Planning Line"."Job Task No.")
                {
                }
                fieldelement(LineType; "Job Planning Line"."Line Type")
                {
                }
                fieldelement(Type; "Job Planning Line".Type)
                {
                    FieldValidate = yes;
                }
                fieldelement(No; "Job Planning Line"."No.")
                {
                    FieldValidate = yes;
                }
                fieldelement(uom; "Job Planning Line"."Unit of Measure Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Description; "Job Planning Line".Description)
                {
                    FieldValidate = no;
                }
                fieldelement(Quantity; "Job Planning Line".Quantity)
                {
                }
                fieldelement(QtytoOrder; "Job Planning Line"."Qty. to Order")
                {
                }
                fieldelement(UnitCost; "Job Planning Line"."Unit Cost")
                {
                }
                fieldelement(VATBUS; "Job Planning Line"."VAT Bus. Posting Group")
                {
                    MinOccurs = Zero;
                }
                fieldelement(VATPROD; "Job Planning Line"."VAT Prod. Posting Group")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ROADCODE; "Job Planning Line"."Road Code")
                {
                    FieldValidate = no;
                    MinOccurs = Zero;
                }

                trigger OnAfterInsertRecord()
                begin
                    "Job Planning Line"."Line Type" := "Job Planning Line"."line type"::"Both Budget and Billable";
                    // "Job Planning Line"."Qty. to Order":="Job Planning Line"."Qty. to Order";
                    // "Job Planning Line".MODIFY;
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
        Message('Job planning lines imported successfully.');
    end;

    var
        I: Integer;
}

