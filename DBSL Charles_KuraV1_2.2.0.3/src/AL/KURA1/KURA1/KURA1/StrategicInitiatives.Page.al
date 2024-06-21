#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80030 "Strategic Initiatives"
{
    PageType = ListPart;
    SourceTable = "Strategic Initiative";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Goal Description"; Rec."Goal Description")
                {
                    ApplicationArea = All;
                }

                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Strategic Plan ID"; Rec."Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    visible = false;
                }
                field("Theme ID"; Rec."Theme ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Key Result Area';
                    Visible = false;
                }
                field(strategy; Rec.strategys)
                {
                    ApplicationArea = Basic;
                    Caption = 'Strategies';
                }
                field("Objective ID"; Rec."Objective ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Strategy ID"; Rec."Strategy ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Activities';
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                }
                field("Perfomance Indicator"; Rec."Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Caption = 'KPI';
                    visible = false;
                }
                field("Key Perfromance Indicator"; Rec."Key Perfromance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'OVI';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Source Of Fund"; Rec."Source Of Fund")
                {
                    ApplicationArea = Basic;
                    Visible = FALSE;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Primary Directorate Name"; Rec."Primary Directorate Name")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Caption = 'Actor';
                }
                field("CSP Planned Target"; Rec."CSP Planned Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'SP Planned Targets';
                }
                field("Collective Budget"; Rec."Collective target")
                {
                    ApplicationArea = BASIC;
                    Caption = 'Planned Budget';
                    Editable = false;
                }
                field("Total Posted Planned Target"; Rec."Total Posted Planned Target")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Posted Planned Target';
                    Visible = false;
                }
                field("Total Achieved Target"; Rec."Total Achieved Target")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Posted Planned Budget"; Rec."Total Posted Planned Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Posted Planned Budget';
                    Visible = false;
                }
                field("Total Usage Budget"; Rec."Total Usage Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }

                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department Name"; Rec."Primary Department Name")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Annual Reporting Codes"; Rec."Annual Reporting Codes")
                {
                    ApplicationArea = basic;
                    //Visible = false;

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                action("Implementation Period")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Strategic Int Planning Lines";
                    RunPageLink = "Strategic Plan ID" = field("Strategic Plan ID"),
                                  "Theme ID" = field("Theme ID"),
                                  "Objective ID" = field("Objective ID"),
                                  "Strategy ID" = field("Strategy ID"),
                                  Code = field(Code),
                                  "Primary Directorate" = field("Primary Directorate");
                }
            }
        }
    }
}

#pragma implicitwith restore

