#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 70101 "Create XML Feed"
{

    // trigger OnRun()
    // begin
    //     Cust.Reset;
    //     Cust.SetRange(Cust."No.", '004', '005');
    //     if Cust.FindSet then begin
    //       FileName := 'C:\Data\CustIntegration.XML';
    //       if IsNull(xmlWriter) then
    //         xmlWriter := xmlWriter.XmlTextWriter(FileName, EncodingText.UTF8);
    //       xmlWriter.WriteStartDocument();
    //       //Create Parent element
    //       xmlWriter.WriteStartElement('CustomerInfo');
    //       repeat
    //         //Create Child elements
    //         xmlWriter.WriteStartElement('Customer');
    //         xmlWriter.WriteElementString('Name', Cust.Name);
    //         xmlWriter.WriteElementString('Address', Cust.Address);
    //         xmlWriter.WriteElementString('Address2', Cust."Address 2");
    //         xmlWriter.WriteEndElement();
    //       until Cust.Next = 0;
    //       //End writing top element and XML document
    //       xmlWriter.WriteEndElement();
    //       xmlWriter.WriteEndDocument();
    //       xmlWriter.Close();
    //     end;
    // end;

    // var
    //     Cust: Record Customer;
    //     FileName: Text[250];
    //    ///////// xmlWriter: dotnet XmlWriter;
    //     EncodingText: dotnet Encoding;
}

