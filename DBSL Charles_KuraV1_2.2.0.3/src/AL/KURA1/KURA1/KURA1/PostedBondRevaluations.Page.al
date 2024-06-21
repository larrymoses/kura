#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54017 "Posted Bond Revaluations"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Bond Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bond Calculator";
    SourceTableView = where(Posted=const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("FXD No";"FXD No")
                {
                    ApplicationArea = Basic;
                }
                field("System Bond No";"System Bond No")
                {
                    ApplicationArea = Basic;
                }
                field("Issue Date";"Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field("Face Value";"Face Value")
                {
                    ApplicationArea = Basic;
                }
                field("Original Term";"Original Term")
                {
                    ApplicationArea = Basic;
                }
                field("Coupon Rate";"Coupon Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Date";"Maturity Date")
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

