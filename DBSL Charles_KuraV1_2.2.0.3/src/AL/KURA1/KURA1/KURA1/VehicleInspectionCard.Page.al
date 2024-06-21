#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59125 "Vehicle Inspection Card"
{
    PageType = Card;
    SourceTable = "Vehicle Inspection";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection No.";"Inspection No.")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No.";"Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Make;Make)
                {
                    ApplicationArea = Basic;
                }
                field(Model;Model)
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle CC";"Vehicle CC")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Inspection Details")
            {
                field("Last Inspection Date";"Last Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Inspection No.";"Last Inspection No.")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Status";"Inspection Status")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date";"Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Has Speed Governor";"Has Speed Governor")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Center";"Inspection Center")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Mark as Passed Inspection")
            {
                ApplicationArea = Basic;
                Image = CheckDuplicates;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Dialog.Confirm('Are you sure you want to mark this Inspection as passed?',true) then begin
                      "Inspection Status" := "inspection status"::Passed;
                      Modify;
                    end;
                end;
            }
            action("Mark as Lost Inspection")
            {
                ApplicationArea = Basic;
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Dialog.Confirm('Are you sure you want to mark this Inspection as failed?',true) then begin
                      "Inspection Status" := "inspection status"::Failed;
                      Modify;
                    end;
                end;
            }
        }
    }
}

