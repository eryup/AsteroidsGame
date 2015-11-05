SpaceShip af1;
Star [] sky;
double accel = .5;
Asteroid bob;
public void setup() 
{
  size(600,600);
  af1=new SpaceShip();
  sky = new Star [200];
  for(int i=0;i<sky.length;i++)
  {
    sky[i]=new Star();
  }
 bob = new Asteroid();
}
public void draw() 
{
  background(50);
  af1.show();
  af1.move();
  for(int i=0;i<sky.length;i++)
  {
    sky[i].show();
  }
  bob.show();
}
public void keyPressed()
{
  if (keyCode==UP)
  {
    af1.accelerate(accel);
  }
  if (keyCode==DOWN)
  {
    af1.accelerate(-accel);
  }
  if (keyCode==LEFT)
  {
    af1.rotate(-5);
  }
  if (keyCode==RIGHT)
  {
    af1.rotate(5);
  }
}
public void keyTyped()
{
  if(key == 'h')
  {
     af1.setDirectionX(0);
     af1.setDirectionY(0);
     af1.setX((int)(Math.random()*600));
     af1.setY((int)(Math.random()*600));
     af1.setPointDirection((int)(Math.random()*360));
  }
}
class SpaceShip extends Floater  
{ 
  public SpaceShip()
  {
    corners=10;
    int[] xS = {-11,-2,4,4,22,4,4,-2,-11,-5};
    int[] yS = {-9,-6,-11,-4,0,4,11,6,9,0};
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX=300;
    myCenterY=300;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }  
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}    
  public double getDirectionX(){return myDirectionX;}  
  public void setDirectionY(double y){myDirectionY=y;}    
  public double getDirectionY(){return myDirectionY;}  
  public void setPointDirection(int degrees){myPointDirection=degrees;}  
  public double getPointDirection(){return myPointDirection;} 
 /* public void show()
    {
      if (keyCode==UP)
      {
        int xLineRotatedTranslated, xLineRotatedTranslated; linex1, liney1, linex2, liney2
        int [] speedline}
        xLineRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
        yLineRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY); 
      }
    }*/
}
class Asteroid extends Floater
{
    public Asteroid()
  {
    corners=6;
    int[] xS = {10,5,-5,-10,-5,5};
    int[] yS = {0,5,5,0,-5,-5};
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX=300;
    myCenterY=300;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }  
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}    
  public double getDirectionX(){return myDirectionX;}  
  public void setDirectionY(double y){myDirectionY=y;}    
  public double getDirectionY(){return myDirectionY;}  
  public void setPointDirection(int degrees){myPointDirection=degrees;}  
  public double getPointDirection(){return myPointDirection;} 
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
class Star
{
    private int myX, myY;
    private color starColor;
  public Star()
  {
    myX=(int)(Math.random()*600);
    myY=(int)(Math.random()*600);
    starColor = color(255);
  }
  public void show()
  {
    fill(starColor);
    ellipse(myX, myY, 3, 3);
  }
}
