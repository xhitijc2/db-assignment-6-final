# app.py is server file
# import email
import re
from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
from matplotlib.pyplot import table
import yaml

app = Flask(__name__)

# configure db
db = yaml.safe_load(open('db.yaml'))
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']


mysql = MySQL(app)


@app.route('/')
def showtable():
    cur = mysql.connection.cursor()
    RESULT = cur.execute(
        "SHOW TABLES")
    # columns = cur.execute('show columns from civilians')
    if RESULT > 0:
        userDetails = cur.fetchall()
        return render_template("homePage.html", userDetails=userDetails)


@app.route('/insert', methods=['GET', 'POST'])
def insert():
    # getting the table name
    tablename = request.args.get('table')[:]
    cur = mysql.connection.cursor()

    cur.execute('SHOW COLUMNS FROM %s' % (tablename))
    columns = cur.fetchall()

    # cmnd = "insert into %s values ("
    # for i in range(len(columns)):
    #     cmnd += "%s,"
    # cmnd = cmnd[:len(cmnd)-1] + ");"

    if request.method == 'POST':
        # fetch form data

        userDetails = request.form

        cmnd = "INSERT INTO " + tablename + "("
        toAdd = [column[0] for column in columns]

        for i in range(len(toAdd)):
            if (i == len(toAdd)-1):
                cmnd += toAdd[i]
            else:
                cmnd += toAdd[i] + ", "

        cmnd = cmnd + ") VALUES ("
        # lst = ['%s']*len(toAdd)
        # lst = tuple(lst)

        # for i in range(len(toAdd)):
        #     if (i == len(toAdd)-1):
        #         cmnd += "%s"
        #     else:
        #         cmnd += "%s, "
        # cmnd = cmnd + ")"

        toAdd = []
        for i in userDetails:
            toAdd.append(userDetails[i])

        for i in range(len(toAdd)):
            if (i == len(toAdd)-1):
                cmnd += "'"+str(toAdd[i])+"'"
            else:
                cmnd += "'"+str(toAdd[i])+"', "
        cmnd = cmnd + ")"

        # toAdd = []
        # for i in userDetails:
        #     toAdd.append(userDetails[i])
        # print("the command is", cmnd)

        # print("the to add is ", toAdd)
        # mysql.connection.commit()
        # cur.close()
        # return render_template('/debug.html', toAdd=toAdd, cmnd=cmnd, columns=columns, userDetails=userDetails)
        # cur.execute(cmnd % tuple(toAdd))
        cur.execute(cmnd)
        cur.fetchall()

        mysql.connection.commit()
        cur.close()
        return render_template('/insertionSuccesful.html')

    return render_template('insert.html', columns=columns)


@ app.route('/users')
def users():
    # print(request.args.get('table')[:])
    # getting the table name
    tablename = request.args.get('table')[:]

    cur = mysql.connection.cursor()
    cur.execute('SHOW COLUMNS FROM %s' % (tablename))
    columns = cur.fetchall()
    RESULT = cur.execute(
        "SELECT * FROM  %s" % (tablename))
    if RESULT > 0:
        userDetails = cur.fetchall()
        return render_template("users.html", userDetails=userDetails, columns=columns)
    # else:
    #     return render_template("users.html", userDetails=userDetails)


@ app.route('/delete', methods=['GET', 'POST'])
def delete():
    if request.method == 'POST':
        # fetch form data
        tablename = request.args.get('table')[:]
        userDetails = request.form
        name = userDetails['name']
        cur = mysql.connection.cursor()
        cur.execute(
            "delete from %s where name= '%s' " % (tablename, name))
        mysql.connection.commit()
        cur.close()
        return redirect('/users')
    return render_template('delete.html')


@ app.route('/update', methods=['GET', 'POST'])
def update():
    if request.method == 'POST':
        # fetch form data
        tablename = request.args.get('table')[:]
        userDetails = request.form
        name = userDetails['name']
        email = userDetails['email']
        cur = mysql.connection.cursor()
        cur.execute(
            "update %s set name=%s where email=%s", (tablename, name, email))
        mysql.connection.commit()
        cur.close()
        return redirect('/users')
    return render_template('update.html')


if __name__ == "__main__":
    app.run(debug=True)


# @app.route('/', methods=['GET', 'POST'])
# def index():
#     if request.method == 'POST':
#         # fetch form data
#         userDetails = request.form
#         name = userDetails['name']
#         email = userDetails['email']
#         cur = mysql.connection.cursor()
#         cur.execute(
#             "show tables")
#         mysql.connection.commit()
#         cur.close()
#         return redirect('/users')
#     return render_template('homePage.html')
