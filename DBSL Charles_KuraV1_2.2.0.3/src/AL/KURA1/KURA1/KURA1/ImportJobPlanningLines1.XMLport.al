#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 80006 "Import Job Planning Lines1"
{
    // Caption = 'Import Work Plan Lines';
    // Direction = Import;
    // Format = VariableText;

    // schema
    // {
    //     textelement(Root)
    //     {
    //         tableelement("Contractor Request Plan Lin e";"Contractor Request Plan Line")
    //         {
    //             AutoReplace = true;
    //             XmlName = 'JobPlanningLines';
    //             fieldelement(Line No;"Contractor Request Plan Line"."Line No.")
    //             {
    //             }
    //             fieldelement(LineTy pe;"Contractor Request Plan Line"."Line Type")
    //             {
    //             }
    //             fieldelement(Ty pe;"Contractor Request Plan Line".Type)
    //             {
    //             }
    //             fieldelement( No;"Contractor Request Plan Line"."No.")
    //             {
    //             }
    //             fieldelement(Descripti on;"Contractor Request Plan Line".Description)
    //             {
    //             }
    //             fieldelement(Quanti ty;"Contractor Request Plan Line".Quantity)
    //             {
    //             }
    //             fieldelement(UnitCo st;"Contractor Request Plan Line"."Unit Cost")
    //             {
    //             }
    //             fieldelement(QtytoOrd er;"Contractor Request Plan Line"."Qty. to Order")
    //             {
    //             }
    //             fieldelement(VATB us;"Contractor Request Plan Line"."VAT Bus. Posting Group")
    //             {
    //             }
    //             fieldelement(VATPr od;"Contractor Request Plan Line"."VAT Prod. Posting Group")
    //             {
    //             }
    //             fieldelement(JobTa sk;"Contractor Request Plan Line"."Job Task No.")
    //             {
    //             }
    //             fieldelement(DTy pe;"Contractor Request Plan Line"."Document Type")
    //             {
    //             }
    //             fieldelement(D No;"Contractor Request Plan Line"."Document No")
    //             {
    //             }

    //             trigger OnAfterInsertRecord()
    //             begin
    //                 // "Job Planning Line"."Line Type":="Job Planning Line"."Line Type"::"Both Budget and Billable";
    //                 // "Job Planning Line"."Qty. to Order":="Job Planning Line"."Qty. to Order";
    //                 // "Job Planning Line".MODIFY;
    //             end;
    //         }
    //     }
    // }

    // requestpage
    // {

    //     layout
    //     {
    //     }

    //     actions
    //     {
    //     }
    // }

    // trigger OnPostXmlPort()
    // begin
    //     //MESSAGE('Job planning lines imported successfully.');
    // end;

    // var
    //     I: Integer;
}

