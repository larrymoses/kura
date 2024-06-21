#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 90000 UpdateDetails1
{
    DefaultLayout = RDLC;
    caption = 'update Details';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    RDLCLayout = './Layouts/UpdateDetails.rdlc';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = where("No." = const('ITM01067'));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                PurchH.Reset;
                PurchH.SetRange("No.", "Purchase Line"."Document No.");
                PurchH.SetRange("Document Type", PurchH."document type"::"Purchase Requisition");
                if PurchH.FindSet then
                    repeat
                    Begin

                        "Purchase Line".Description := 'Projects';

                        "Purchase Line".Amount := Purchh."Estimated Cost";
                        "Purchase Line".Quantity := 1;
                        "Purchase Line".Validate(Quantity);
                    end;
                    "Purchase Line".Modify(true);
                    until "Purchase Line".Next = 0;

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
        PurchH: Record "Purchase Header";
}
