#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72019 "Road Study Conclusions"
{
    Editable = false;
    PageType = List;
    SourceTable = "Road Study Result";
    SourceTableView = where("Result Type"=filter(Conclusion));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Study ID";"Study ID")
                {
                    ApplicationArea = Basic;
                }
                field("Study Task ID";"Study Task ID")
                {
                    ApplicationArea = Basic;
                }
                field("Result Type";"Result Type")
                {
                    ApplicationArea = Basic;
                }
                field("Report Type";"Report Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

