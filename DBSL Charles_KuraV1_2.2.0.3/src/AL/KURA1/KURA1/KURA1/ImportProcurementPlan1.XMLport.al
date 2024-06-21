#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 70003 "Import Procurement Plan1"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Procurement Plan Entry"; "Procurement Plan Entry")
            {
                XmlName = 'ProcurementPlan';
                fieldelement(Plan; "Procurement Plan Entry"."Procurement Plan ID")
                {
                }

                fieldelement(PlanningCategory; "Procurement Plan Entry"."Planning Category")
                {
                }
                fieldelement(Description; "Procurement Plan Entry".Description)
                {
                }
                fieldelement(ResponsibilityCenter; "Procurement Plan Entry".Region)
                {
                }
                fieldelement(ProcurementType; "Procurement Plan Entry"."Procurement Type")
                {
                }
                fieldelement(ProcurementMethod; "Procurement Plan Entry"."Procurement Method")
                {
                }
                fieldelement(Solicitationtype; "Procurement Plan Entry"."Solicitation Type")
                {
                }
                fieldelement(FundingSource; "Procurement Plan Entry"."Funding Source ID")
                {
                }
                fieldelement(Quantity; "Procurement Plan Entry".Quantity)
                {
                }
                fieldelement(UnitCost; "Procurement Plan Entry"."Unit Cost")
                {
                }
                fieldelement(total; "Procurement Plan Entry"."Line Budget Cost")
                {
                }
                fieldelement(preferenceReservation; "Procurement Plan Entry"."Preference/Reservation Code")
                {
                }
                fieldelement(Directorate; "Procurement Plan Entry".Directorate)
                {
                }
                fieldelement(Department; "Procurement Plan Entry".Department)
                {
                }
                fieldelement(Constituency; "Procurement Plan Entry".Constituency)
                {
                }
                fieldelement(Road; "Procurement Plan Entry"."Road No.")
                {
                }
                fieldelement(PROJ; "Procurement Plan Entry"."Budget Control Job No")
                {
                }
                fieldelement(Taskno; "Procurement Plan Entry"."Budget Control Job Task No.")
                {
                }
                fieldelement(startdate; "Procurement Plan Entry"."Procurement Start Date")
                {
                }
                fieldelement(enddate; "Procurement Plan Entry"."Procurement End Date")
                {
                }
                fieldelement(days; "Procurement Plan Entry"."Procurement Duration (Days)")
                {
                }
                fieldelement(region; "Procurement Plan Entry".Region)
                {
                }
                fieldelement(regioncode; "Procurement Plan Entry"."Global Dimension 1 Code")
                {
                }
                fieldelement(fundsource; "Procurement Plan Entry"."Global Dimension 2 Code")
                {
                }
                fieldelement(EstimatedCost; "Procurement Plan Entry"."Estimated Cost of Project")

                {

                }
                fieldelement(AdvertiseTender; "Procurement Plan Entry"."Invite Tender")

                {
                }
                fieldelement(OpenTender; "Procurement Plan Entry"."Open Tender")

                {
                }
                fieldelement(EvaluateTender; "Procurement Plan Entry"."Bid Evaluation")

                {
                }
                fieldelement(ContractSigning; "Procurement Plan Entry"."Signing of Contract")

                {
                }
                fieldelement(TotalTime; "Procurement Plan Entry"."Time to Contract Completion")

                {
                }
                trigger OnAfterInsertRecord()
                begin

                    ProcurementPlanLines.Reset;
                    if ProcurementPlanLines.FindLast then
                        LineNo := ProcurementPlanLines."PP Line No" + 1;

                    PPEntry.Reset;
                    PPEntry.SetRange("Procurement Plan ID", "Procurement Plan Entry"."Procurement Plan ID");
                    if PPEntry.FindSet then begin
                        repeat
                            PPEntry.Validate(Quantity);
                            ProcurementPlanLines.Reset;
                            ProcurementPlanLines.SetRange("Procurement Plan ID", "Procurement Plan Entry"."Procurement Plan ID");
                            ProcurementPlanLines.SetRange("Planning Category", "Procurement Plan Entry"."Planning Category");
                            if not ProcurementPlanLines.FindSet then begin
                                ProcurementPlanLines.Init;
                                ProcurementPlanLines.Validate(ProcurementPlanLines."Procurement Plan ID", "Procurement Plan Entry"."Procurement Plan ID");
                                ProcurementPlanLines."PP Line No" := LineNo + 1;
                                ProcurementPlanLines.Validate("Planning Category", "Procurement Plan Entry"."Planning Category");
                                ProcurementPlanLines.Validate("Procurement Type", "Procurement Plan Entry"."Procurement Type");
                                ProcurementPlanLines.Validate("Solicitation Type", "Procurement Plan Entry"."Solicitation Type");
                                ProcurementPlanLines.Validate("Procurement Method", "Procurement Plan Entry"."Procurement Method");
                                ProcurementPlanLines.Validate("Primary Source of Funds", "Procurement Plan Entry"."Funding Source ID");
                                ProcurementPlanLines.Insert(true);
                                LineNo += 1;
                            end;
                        until PPEntry.Next = 0;
                    end;
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
        Message('Procurement Plan Imported Successfully');
    end;

    var
        ProcurementPlanLines: Record "Procurement Plan Lines";
        PPEntry: Record "Procurement Plan Entry";
        PPActivity: Record "Procurement Activity Code";
        PPPlanActivity: Record "PP Purchase Activity Schedule";
        LineNo: Integer;
}

