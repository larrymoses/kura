#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99454 "Intervention Setup"
{
    PageType = List;
    SourceTable = 99453;

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
                field("Intervention Description"; Rec."Intervention Description")
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
Page 99457 "Respondent Category Setup"
{
    PageType = List;
    SourceTable = 99454;

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
                field("Respondent Category"; Rec."Respondent Category")
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
Page 99458 "ExtentOfAgreementMeasureSetup"
{
    PageType = List;
    SourceTable = ExtentOfAgreementMeasureSetup;
    Caption = 'Extent Of Agreement Measure Setup';

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
                field(ExtentOfAgreementMeasureSetup; Rec.ExtentOfAgreementMeasureSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Extent Of Agreement Measure Setup';
                }
            }
        }
    }

    actions
    {
    }
}
Page 99459 "ExtentOfAgrtMeasureOISetup"
{
    PageType = List;
    SourceTable = ExtentOfAgreementOnImpactSetup;
    Caption = 'Extent Of Agreement Measure On Impact Setup';

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
                field(ExtentOfAgreeMeasureSetupOI; Rec.ExtentOfAgreeMeasureSetupOI)
                {
                    ApplicationArea = Basic;
                    Caption = 'Extent Of Agreement Measure On Impact Setup';
                    visible = true;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

