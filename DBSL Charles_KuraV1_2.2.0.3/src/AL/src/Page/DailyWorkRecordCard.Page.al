#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72079 "Daily Work Record Card"
{
    PageType = Card;
    SourceTable = "Daily Work Records";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Daily Work No"; "Daily Work No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Authority"; "Road Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority Name"; "Road Authority Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Contractor; Contractor)
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Project)
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Name/Chainage"; "Road Name/Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class"; "Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Inspected By"; "Inspected By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Standard Service Level"; "Standard Service Level")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; "Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Link Name"; "Link Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control11; "Daily Work Record Line")
            {
                SubPageLink = Project = field(Project),
                              "Header No" = field("Daily Work No");
            }
            part(Control12; "Daily Record Machinery & Truck")
            {
                SubPageLink = Project = field(Project);
            }
            part(Control13; "Daily Record Admission")
            {
                SubPageLink = Project = field(Project);
            }
        }
        area(FactBoxes)
        {
            part(Control1906354007; "Document Attachment Factbox")
            {

                SubPageLink = "Table ID" = const(72052),
                              "No." = field("Daily Work No");

            }
        }
    }

    actions
    {
    }
}

