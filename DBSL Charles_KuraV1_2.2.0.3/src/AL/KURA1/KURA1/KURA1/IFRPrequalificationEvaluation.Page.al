#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75363 "IFRPrequalification Evaluation"
{
    ApplicationArea = Basic;
    CardPageID = "IFR Evaluation Vouchers";
    Editable = false;
    PageType = List;
    SourceTable = "Prequalification Score Header";
    SourceTableView = where(Type=const(Multiple),
                            "Process Type"=const(Registration));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("IFP No."; Rec."IFP No.")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Evaluation Te"; Rec."Prequalification Evaluation Te")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead"; Rec."Evaluation Lead")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead Name"; Rec."Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Responsibility Center"; Rec."Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

