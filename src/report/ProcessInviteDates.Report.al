report 50005 ProcessInviteDates
{
    ApplicationArea = All;
    Caption = 'ProcessInviteDates';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(ProcurementPlanEntry; "Procurement Plan Entry")
        {

            trigger OnAfterGetRecord()
            var
                ProcurementPlanEntry1: Record "Procurement Plan Entry";
            begin
                //rfq
                ProcurementPlanEntry1.reset;
                ProcurementPlanEntry1.setrange(ProcurementPlanEntry1."Procurement Plan ID", ProcurementPlanEntry."Procurement Plan ID");
                ProcurementPlanEntry1.SetRange(ProcurementPlanEntry1."Procurement Method", ProcurementPlanEntry1."Procurement Method"::RFQ);
                if ProcurementPlanEntry1.FindSet then begin
                    repeat

                        ProcurementPlanEntry1."Invite Tender" := DMY2Date(08, 08, 2023);
                        ProcurementPlanEntry1."Open Tender" := DMY2Date(08, 08, 2023)
                   ;
                        ProcurementPlanEntry1."Bid Evaluation" := DMY2Date(26, 09, 2023)
                     ;
                        ProcurementPlanEntry1."Tender Committee Action" := DMY2Date(26, 09, 2023)
                     ;
                        ProcurementPlanEntry1."Notification of Award" := DMY2Date(10, 10, 2023)
                    ;
                        ProcurementPlanEntry1."Signing of Contract" := DMY2Date(24, 10, 2023);

                        ProcurementPlanEntry1.Modify(true);
                    until ProcurementPlanEntry1.next = 0;

                end;

                //low
                ProcurementPlanEntry1.reset;
                ProcurementPlanEntry1.setrange(ProcurementPlanEntry1."Procurement Plan ID", ProcurementPlanEntry."Procurement Plan ID");
                ProcurementPlanEntry1.SetRange(ProcurementPlanEntry1."Procurement Method", ProcurementPlanEntry1."Procurement Method"::"Low Value Procurement");
                if ProcurementPlanEntry1.FindSet then begin
                    repeat

                        ProcurementPlanEntry1."Invite Tender" := DMY2Date(08, 08, 2023);
                        ProcurementPlanEntry1."Open Tender" := DMY2Date(08, 08, 2023)
                   ;
                        ProcurementPlanEntry1."Bid Evaluation" := DMY2Date(23, 09, 2023)
                          ;
                        ProcurementPlanEntry1."Tender Committee Action" := DMY2Date(26, 09, 2023)
                     ;
                        ProcurementPlanEntry1."Notification of Award" := DMY2Date(10, 10, 2023)
                    ;
                        ProcurementPlanEntry1."Signing of Contract" := DMY2Date(24, 10, 2023);

                        ProcurementPlanEntry1.Modify(true);
                    until ProcurementPlanEntry1.next = 0;

                end;
                //open
                ProcurementPlanEntry1.reset;
                ProcurementPlanEntry1.setrange(ProcurementPlanEntry1."Procurement Plan ID", ProcurementPlanEntry."Procurement Plan ID");
                ProcurementPlanEntry1.SetRange(ProcurementPlanEntry1."Procurement Method", ProcurementPlanEntry1."Procurement Method"::"Open Tender");
                if ProcurementPlanEntry1.FindSet then begin
                    repeat


                        ProcurementPlanEntry1."Invite Tender" := DMY2Date(08, 08, 2023);
                        ProcurementPlanEntry1."Open Tender" := DMY2Date(08, 08, 2023)
                   ;
                        ProcurementPlanEntry1."Bid Evaluation" := DMY2Date(23, 09, 2023)
                          ;
                        ProcurementPlanEntry1."Tender Committee Action" := DMY2Date(26, 09, 2023)
                     ;
                        ProcurementPlanEntry1."Notification of Award" := DMY2Date(10, 10, 2023)
                     ;
                        ProcurementPlanEntry1."Signing of Contract" := DMY2Date(24, 10, 2023);

                        ProcurementPlanEntry1.Modify(true);
                    until ProcurementPlanEntry1.next = 0;
                end;



                //direct
                ProcurementPlanEntry1.reset;
                ProcurementPlanEntry1.setrange(ProcurementPlanEntry1."Procurement Plan ID", ProcurementPlanEntry."Procurement Plan ID");
                ProcurementPlanEntry1.SetRange(ProcurementPlanEntry1."Procurement Method", ProcurementPlanEntry1."Procurement Method"::"Direct Procurement");
                if ProcurementPlanEntry1.FindSet then begin
                    repeat


                        ProcurementPlanEntry1."Invite Tender" := DMY2Date(08, 08, 2023);
                        ProcurementPlanEntry1."Open Tender" := DMY2Date(08, 08, 2023)
                   ;
                        ProcurementPlanEntry1."Bid Evaluation" := DMY2Date(23, 09, 2023)
                     ;
                        ProcurementPlanEntry1."Tender Committee Action" := DMY2Date(26, 09, 2023)
                     ;
                        ProcurementPlanEntry1."Notification of Award" := DMY2Date(10, 10, 2023)
                         ;
                        ProcurementPlanEntry1."Signing of Contract" := DMY2Date(24, 10, 2023);

                        ProcurementPlanEntry1.Modify(true);
                    until ProcurementPlanEntry1.next = 0;
                end;
            end;

            //  Message('Sucess4!');


            trigger OnPostDataItem()
            var

            begin
                DIALOG.MESSAGE('Successfull. Thank you!');
            end;



        }


    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }


}