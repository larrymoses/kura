#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 80002 "Import Job Tasks"
{
    Caption = 'Import Work Plan Lines';
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Job Task";"Job Task")
            {
                AutoReplace = true;
                XmlName = 'JobTasks';
                fieldelement(JobNo;"Job Task"."Job No.")
                {
                }
                fieldelement(JobTaskNo;"Job Task"."Job Task No.")
                {
                }
                fieldelement(Description;"Job Task".Description)
                {
                }
                fieldelement(ttle;"Job Task"."Job Task Type")
                {
                }
                fieldelement(RegionCode;"Job Task"."Global Dimension 1 Code")
                {
                }
                fieldelement(FundingSource;"Job Task"."Funding Source")
                {
                    FieldValidate = yes;
                }
                fieldelement(ProjectLocation;"Job Task".Location)
                {
                    MinOccurs = Zero;
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

