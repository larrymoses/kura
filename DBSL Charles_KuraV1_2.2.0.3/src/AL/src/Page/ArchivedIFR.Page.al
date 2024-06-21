#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75350 "Archived IFR"
{
    ApplicationArea = Basic;
    CardPageID = "IFR Card";
    Editable = false;
    PageType = List;
    SourceTable = "Request For Information";
    SourceTableView = where("Document Type"=const("Invitation for Registation"),
                            Published=const(true),
                            Type=const("Main IFP"));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Link to  No Series on the E-Procurement Setup Table (Different No. Series shall be defined for different Request for Information e.g. IFP,EOI';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 3 Code";"Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(County;County)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control42;Outlook)
            {
            }
            systempart(Control43;Notes)
            {
            }
            systempart(Control44;MyNotes)
            {
            }
            systempart(Control45;Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //SetSecurityFilterOnRespCenter;
    end;
}

