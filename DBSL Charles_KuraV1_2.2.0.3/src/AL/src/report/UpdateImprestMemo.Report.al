#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69426 "Update Imprest Memo"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Imprest Memo.rdlc';

    dataset
    {
        dataitem("Project Members";"Project Members")
        {
            DataItemTableView = where("No."=filter(<>'CASUAL01'));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Project Members".Validate("No.");
                "Project Members".Modify(true);
            end;
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

    labels
    {
    }
}

