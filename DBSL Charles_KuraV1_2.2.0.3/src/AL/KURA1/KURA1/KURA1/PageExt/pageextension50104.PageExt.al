#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50104 "pageextension50104" extends "Fixed Asset Setup" 
{
    layout
    {
        addafter("Automatic Insurance Posting")
        {
            field("Insurance Expiry Period";"Insurance Expiry Period")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

