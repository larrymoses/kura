#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72078 "Daily Work Record"
{
    ApplicationArea = Basic;
    CardPageID = "Daily Work Record Card";
    PageType = List;
    SourceTable = "Daily Work Records";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Daily Work No"; Rec."Daily Work No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority"; Rec."Road Authority")
                {
                    ApplicationArea = Basic;
                }
                field(Contractor; Rec.Contractor)
                {
                    ApplicationArea = Basic;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                }
                field("Road Name/Chainage"; Rec."Road Name/Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Inspected By"; Rec."Inspected By")
                {
                    ApplicationArea = Basic;
                }
                field("Standard Service Level"; Rec."Standard Service Level")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
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

#pragma implicitwith restore

