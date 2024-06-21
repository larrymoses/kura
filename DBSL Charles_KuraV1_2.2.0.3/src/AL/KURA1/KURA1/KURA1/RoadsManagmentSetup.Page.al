//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

Page 52018 "Roads Managment Setup"
{
   // ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Roads Management Setup";
    //UsageCategory = Administration;
  //  Visible =false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'No. Series';
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Feasibility Nos."; Rec."Feasibility Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Project  Nos"; Rec."Project  Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Section Nos"; Rec."Section Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Projects Nos"; Rec."Construction Projects Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Projects Nos"; Rec."Maintenance Projects Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Surveys_Studies_Designs Nos"; Rec."Surveys_Studies_Designs Nos")
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



