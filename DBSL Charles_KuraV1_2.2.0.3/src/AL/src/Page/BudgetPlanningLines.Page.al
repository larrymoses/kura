#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65112 "Budget Planning Lines"
{
    // Caption = 'Budget Planning Lines';
    // DataCaptionExpression = Caption;
    // PageType = ListPart;
    // PromotedActionCategories = 'New,Process,Report,Outlook';
    // SourceTable = "Project Budget Planning Line";

    // layout
    // {
    //     area(content)
    //     {
    //         repeater(Control1)
    //         {
    //             field("Project Budget ID";"Project Budget ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Job No.";"Job No.")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Job Task No.";"Job Task No.")
    //             {
    //                 ApplicationArea = All;
    //                 ToolTip = 'Specifies the number of the related job task.';
    //             }
    //             field("Line Type";"Line Type")
    //             {
    //                 ApplicationArea = Jobs;
    //                 Editable = false;
    //                 ToolTip = 'Specifies the type of planning line.';
    //             }
    //             field(Quantity;Quantity)
    //             {
    //                 ApplicationArea = Jobs;
    //                 ToolTip = 'Specifies the number of units of the resource, item, or general ledger account that should be specified on the planning line. If you later change the No., the quantity you have entered remains on the line.';
    //             }
    //             field(Type;Type)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("No.";"No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Budget Type";"Budget Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Job Budget Templates";"Job Budget Templates")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Unit Cost (LCY)";"Unit Cost (LCY)")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = true;
    //             }
    //             field("Total Cost";"Total Cost")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = true;
    //                 Visible = false;
    //             }
    //             field("Total Cost (LCY)";"Total Cost (LCY)")
    //             {
    //                 ApplicationArea = Jobs;
    //                 Editable = false;
    //                 ToolTip = 'Specifies the total cost for the planning line. The amount is in the local currency.';
    //             }
    //             field("Directorate Code";"Directorate Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Department Code";"Department Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Division;Division)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    // }

    // trigger OnInit()
    // var
    //     SMTPMailSetup: Record "Email Account";
    //     MailManagement: Codeunit Mail;
    // begin
    // end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     Type:=Type::"G/L Account";
    // end;

    // trigger OnOpenPage()
    // var
    //     Job: Record Job;
    // begin
    //     Type:=Type::"G/L Account";
    // end;
}

