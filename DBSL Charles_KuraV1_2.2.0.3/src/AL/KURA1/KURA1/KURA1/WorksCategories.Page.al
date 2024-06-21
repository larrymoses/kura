#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75099 "Works Categories"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Works Category";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Default BoQ Template Code"; Rec."Default BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Default Directorate"; Rec."Default Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Default Department"; Rec."Default Department")
                {
                    ApplicationArea = Basic;
                }
                field("Default Procurement Category"; Rec."Default Procurement Category")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account";Rec."G/L Account")
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

#pragma implicitwith restore

