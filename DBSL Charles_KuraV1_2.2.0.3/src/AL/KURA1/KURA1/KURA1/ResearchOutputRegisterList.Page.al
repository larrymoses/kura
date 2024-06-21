#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65018 "Research Output Register List"
{
    ApplicationArea = Basic;
    CardPageID = "Research Output Register Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Output Register";
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
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Research Project Id";"Research Project Id")
                {
                    ApplicationArea = Basic;
                }
                field("Research Program Id";"Research Program Id")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output Category";"Research Output Category")
                {
                    ApplicationArea = Basic;
                }
                field("Principle Investigator";"Principle Investigator")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output SubCategory";"Research Output SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output Title";"Research Output Title")
                {
                    ApplicationArea = Basic;
                }
                field(Abstract;Abstract)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Publication Status";"Publication Status")
                {
                    ApplicationArea = Basic;
                }
                field("Visibilty Category";"Visibilty Category")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
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

