#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95076 "Risk Appetite Rating Scales"
{
    CardPageID = "Risk Appetite/Tolerance Scale";
    Editable = false;
    PageType = List;
    SourceTable = "Risk Rating Scale";
    SourceTableView = where("Risk Rating Scale Type"=filter("Risk Appetite Rating"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Rating Scale Type";"Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Scale ID";"Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments";"Additional Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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
