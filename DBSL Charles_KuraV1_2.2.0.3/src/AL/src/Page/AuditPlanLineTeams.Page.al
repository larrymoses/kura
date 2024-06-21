#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95171 "Audit Plan Line Teams"
{
    CardPageID = "Audit Plan Line Team";
    PageType = List;
    SourceTable = "Audit Plan Line Team";

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
                field("Engagement Line No.";"Engagement Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No.";"Resource No.")
                {
                    ApplicationArea = Basic;
                    TableRelation = Resource;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Audit Team Type";"Audit Team Type")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Role";"Engagement Role")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Default Audit Location ID";"Default Audit Location ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field(Blocekd;Blocekd)
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

