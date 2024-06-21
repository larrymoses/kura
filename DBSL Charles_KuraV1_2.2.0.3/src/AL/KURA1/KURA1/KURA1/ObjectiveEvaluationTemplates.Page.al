#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80071 "Objective Evaluation Templates"
{
    CardPageID = "Competency Performance Temps";
    PageType = List;
    SourceTable = "Objectives Evaluation Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("General Instructions";"General Instructions")
                {
                    ApplicationArea = Basic;
                }
                field("Global?";"Global?")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Responsibility Center";"Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Rating Scale";"Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Total Score Model";"Total Score Model")
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

