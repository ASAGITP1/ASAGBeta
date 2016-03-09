#ifndef XWRITE_H
#define XWRITE_H

#include <QObject>
#include <QtWidgets>

class Xwrite : public QObject
{
    Q_OBJECT
public:
    explicit Xwrite(QObject *parent = 0): QObject(parent) {}
    Q_INVOKABLE void writeXML(int shipid, int slot1 =0, int slot2 =0, int slot3 =0, int slot4=0, int slot5=0,int slot6=0,int slot7=0, int slot8=0, int slot9=0, int slot10=0, int slot11=0, int slot12=0, int slot13=0, int slot14=0,int slot15=0, int slot16=0, int slot17=0, int slot18=0, int slot19=0, int slot20=0){
        QXmlStreamWriter xmlWriter;
        QFile file("ship.xml");

        //QString is the needed type of variables for the QXmlStreamWriter, therefore we need to convert int to QString
        //Assuming that the Ship HAS TO HAVE an id...
        QString qshipid = QString::number(shipid);
        //QString lvlS = QString::number(lvl);
        int slotint=1;

        if (!file.open(QIODevice::WriteOnly))
        {
          QMessageBox::warning(0, "Error!", "Error opening file");
        }
        else
        {
        xmlWriter.setDevice(&file);

        /* Writes a document start with the XML version number. */
        xmlWriter.writeStartDocument();
        xmlWriter.writeStartElement("xml_try_V_1");

        xmlWriter.writeStartElement("ship");
        /*add one attribute and its value*/
        xmlWriter.writeAttribute("id",qshipid);
        /*add character data to tag student */
        xmlWriter.writeCharacters ("possible LVL of the module");
        /*close tag student  */
        xmlWriter.writeEndElement();

        //Variables have to be integer to calculate with them
        //only adds XML if slot exists
        //opening first
        //ATTENTION: IF the modulelvl information has to be saved as XMLCharacters, in every if-function a xmlWriter.writeCharacters(); function has to be added
        if(slot1){
            //only convert slot to QString if existing
            QString qslot1=QString::number(slot1);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot1);
            xmlWriter.writeEndElement();
        }
        slotint++;//is used to have the module in the right slot

        if(slot2){

            QString qslot2=QString::number(slot2);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot2);

            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot3){

            QString qslot3=QString::number(slot3);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot3);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot4){

            QString qslot4=QString::number(slot4);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot4);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot5){

            QString qslot5=QString::number(slot5);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot5);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot6){

            QString qslot6=QString::number(slot6);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot6);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot7){

            QString qslot7=QString::number(slot7);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot7);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot8){

            QString qslot8=QString::number(slot8);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot8);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot9){

            QString qslot9=QString::number(slot9);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot9);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot10){

            QString qslot10=QString::number(slot10);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot10);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot11){

            QString qslot11=QString::number(slot11);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot11);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot12){

            QString qslot12=QString::number(slot12);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot12);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot13){

            QString qslot13=QString::number(slot13);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot13);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot14){

            QString qslot14=QString::number(slot14);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot14);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot15){

            QString qslot15=QString::number(slot15);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot15);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot16){

            QString qslot16=QString::number(slot16);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot16);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot17){

            QString qslot17=QString::number(slot17);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot17);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot18){

            QString qslot18=QString::number(slot18);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot18);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot19){

            QString qslot19=QString::number(slot19);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot19);
            xmlWriter.writeEndElement();
        }
        slotint++;
        if(slot20){

            QString qslot20=QString::number(slot20);
            QString slotnum=QString::number(slotint);

            xmlWriter.writeStartElement("slot");
            xmlWriter.writeAttribute("num",slotnum);
            xmlWriter.writeAttribute("id",qslot20);
            xmlWriter.writeEndElement();
        }





            /*end anchor element*/
            xmlWriter.writeEndElement();
            /*end document */
            xmlWriter.writeEndDocument();
        }
    }
 };




#endif // XWRITE_H
