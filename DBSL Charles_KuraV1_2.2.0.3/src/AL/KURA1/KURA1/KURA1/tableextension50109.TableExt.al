#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50109 "tableextension50109" extends "Segment Wizard Filter" 
{
    fields
    {
        modify("Profile Questn. Line Filter")
        {
            TableRelation = "Profile Questionnaire Line"."Line No." where ("Profile Questionnaire Code"=field("Profile Questn. Code Filter"),
                                                                           Type=const(Question));
        }
    }
}

