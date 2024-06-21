#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50095 "pageextension50095" extends "Employee Qualifications" 
{
    layout
    {
        addafter(Cost)
        {
            field(Year;Year)
            {
                ApplicationArea = Basic;
            }
            field(Specialization;Specialization)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

