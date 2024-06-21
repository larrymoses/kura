#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 99323 "Invitation to Tender List"
{
    AdditionalSearchTerms = 'recurring sales,reorder,repeat sales';
    ApplicationArea = Suite;
    Caption = 'Invitation to Tender Notices';
    CardPageID = "Invitation to Tender Card";
    Editable = false;
    PageType = List;
    SourceTable = "Standard Sales Code";
    SourceTableView = where(Status = filter("Pending Approval" | Open));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a code which identifies this standard sales code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of the standard sales code.';
                }
                field("Method of Disposal"; "Method of Disposal")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Disposal Type"; "Disposal Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("External Document No"; "External Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Assigned Procurement Officer"; "Assigned Procurement Officer")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Requesting Directorate"; "Requesting Directorate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Requesting Department"; "Requesting Department")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Summary"; "Tender Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the currency code of the amounts on the standard sales lines.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }
}
