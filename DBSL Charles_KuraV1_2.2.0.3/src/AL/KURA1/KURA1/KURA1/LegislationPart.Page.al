#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72141 "Legislation Part"
{
    PageType = ListPart;
    SourceTable = "Legislation Part";
    SourceTableView = where("Part Type"=filter("Section/Clause"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Part ID";"Part ID")
                {
                    ApplicationArea = Basic;
                }
                field("Part Type";"Part Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Subsections";"No. of Subsections")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Line Functions")
            {
                AccessByPermission = TableData Item=R;
                ApplicationArea = Basic,Suite;
                Caption = 'Line Functions';
                Ellipsis = true;
                Image = NewItem;
                ToolTip = 'Add two or more items from the full list of your inventory items.';
            }
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group(Subsection)
                {
                    Caption = 'Subsection';
                    Image = ItemAvailability;
                    action(SubSections)
                    {
                        ApplicationArea = Basic,Suite;
                        Caption = 'Subsections';
                        Image = "Event";
                        RunObject = Page "Legislation Subsection";
                        RunPageLink = "Legislation ID"=field("Legislation ID"),
                                      "Part ID"=field("Part ID");
                    }
                }
            }
        }
    }
}

