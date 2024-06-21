#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95165 "Audit Plans"
{
    CardPageID = "Audit Plan";
    PageType = List;
    SourceTable = "Audit Plan";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Plan ID";"Audit Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan Type";"Audit Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code";"Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Start Date";"Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date";"Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID";"Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Overall Purpose";"Overall Purpose")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Audit Charter ID";"Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                }
                field("Chief Audit Executive ID";"Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Budgeted New Audit Proj";"No. Of Budgeted New Audit Proj")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Budgeted WIP Audit Proj";"No. Of Budgeted WIP Audit Proj")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Budgeted Audit Follow-u";"No. Of Budgeted Audit Follow-u")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Datetime";"Created Datetime")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
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

