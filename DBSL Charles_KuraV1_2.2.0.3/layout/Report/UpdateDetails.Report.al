#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 90001 UpdateImprestlines
{
    DefaultLayout = RDLC;
    caption = 'UpdateImprestlines';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    RDLCLayout = './Layouts/UpdateDetails.rdlc';

    dataset
    {
        dataitem("Imprest Lines"; "Imprest Lines")
        {
            // DataItemTableView = where("No." = const('ITM01067'));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IMLINES.Reset();
                IMLINES.SetRange(IMLINES.No, "Imprest Lines".No);
                if IMLINES.FindSet() then
                    repeat
                        IMLINES.Validate("No. of Days");
                        IMLINES.Modify(true);
                    until IMLINES.Next() = 0;

            end;


            trigger OnPostDataItem()
            begin
                Message('Sucessfully Done');
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

    var
        IMLINES: Record "Imprest Lines";
}
