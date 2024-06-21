#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72014 "Feasibility Studies"
{
    ApplicationArea = Basic;
    CardPageID = "Feasibilty Study Card";
    PageType = List;
    SourceTable = "Road Study_Survey";
    SourceTableView = where("Study/Survey Type"=filter("Feasibility Study"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Study ID";"Study ID")
                {
                    ApplicationArea = Basic;
                }
                field("Study/Survey Type";"Study/Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Road Asset ID";"Road Asset ID")
                {
                    ApplicationArea = Basic;
                }
                field("All Road Sections";"All Road Sections")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Execution Approach";"Primary Execution Approach")
                {
                    ApplicationArea = Basic;
                }
                field("Study Abstract";"Study Abstract")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Funding Agency ID";"Primary Funding Agency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Type";"Funding Source Type")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency Contacts";"Funding Agency Contacts")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency Name";"Funding Agency Name")
                {
                    ApplicationArea = Basic;
                }
                field("Person Responsible";"Person Responsible")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager";"Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date";"Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Distance (KM)";"Total Distance (KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1";"Global Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2";"Global Dimension 2")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate ID";"Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department ID";"Primary Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No.";"External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Study Admin Officer ID";"Study Admin Officer ID")
                {
                    ApplicationArea = Basic;
                }
                field("Admin Officer Name";"Admin Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Study Finance Officer ID";"Study Finance Officer ID")
                {
                    ApplicationArea = Basic;
                }
                field("Total Approved Budget (LCY)";"Total Approved Budget (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Regional Director Name";"Regional Director Name")
                {
                    ApplicationArea = Basic;
                }
                field("Regional Director ID";"Regional Director ID")
                {
                    ApplicationArea = Basic;
                }
                field("Study Finance Officer Name";"Study Finance Officer Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Study/Survey Type":="study/survey type"::"Feasibility Study";
    end;
}

