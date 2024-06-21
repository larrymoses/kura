#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 80004 "Import Bill Categories"
{
    Caption = 'Import Work Plan Lines';
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("New Road Work Program Task";"New Road Work Program Task")
            {
                AutoReplace = true;
                XmlName = 'JobTasks';
                fieldelement(RoadWorkProgramID;"New Road Work Program Task"."Road Work Program ID")
                {
                }
                fieldelement(PackageNo;"New Road Work Program Task"."Package No.")
                {
                }
                fieldelement(BillItemCategoryCode;"New Road Work Program Task"."Bill Item Category Code")
                {
                }
                fieldelement(BillItemDescrption;"New Road Work Program Task".Description)
                {
                    MinOccurs = Zero;
                }
                fieldelement(EntryNo;"New Road Work Program Task"."Entry No")
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

    trigger OnPostXmlPort()
    begin
        Message('The job task(s) imported successfuly');
    end;

    var
        I: Integer;
}

